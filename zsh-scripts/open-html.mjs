#!/usr/bin/env node

import { execSync, exec } from 'node:child_process';
import prompts from 'prompts';
import ora, { oraPromise } from 'ora';

var args = process.argv.slice(2);

async function execute(command) {
  return new Promise((resolve, reject) => {
    exec(command, (err, output) => {
      // once the command has completed, the callback function is called
      if (err) {
        // log and return if we encounter an error
        console.error('Could not execute command: ', err);
        reject();
      }
      resolve(output);
    });
    // exec(command, {
    //   stdio: 'ignore',
    // }).on('close', (code) => {
    //   if (code === 0) {
    //     console.log('Output: \n', output);
    //     resolve();
    //   }
    //   reject();
    // });
  });
}

async function listFiles(files) {
  return prompts(
    [
      {
        type: 'select',
        name: 'file',
        message: 'Velg fil',
        choices: files.map((it) => ({ title: it, value: it })),
      },
    ],
    {
      onCancel: () => {
        process.exit(1);
      },
    }
  );
}

async function findFiles() {
  return await execute(
    `find . -type f -name "${args[0]}.html" -not -path \'*/node_modules/*\'`
  );
}

const fileList = await oraPromise(findFiles, {
  text: '🔎 Leter etter filer...',
  successText: '🔎 Filsøk ferdig!',
});

if (fileList.length === 0) {
  console.log('Ingen html-filer i denne mappa gitt');
} else {
  const files = fileList.trim().split('\n');
  const choice = await listFiles(files);
  await oraPromise(execute(`open -a "${args[1]}" ${choice.file}`), {
    text: '🦊 Åpner i nettleser',
  });
}
