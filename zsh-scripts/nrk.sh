export VAULT_ADDR="https://vault.nrk.cloud:8200"



dh-pg() {
    name=$1
    environment=$2

    if [ -z "$environment" ]; then
        environment="stage"
        echo "env not set, defaulting to $environment"
    fi

    secret_path=""

    case $name in
        tilbakemelding)
            secret_path="secret/applications/dh/${environment}/tilbakemelding/psql_${environment}_credentials"
            ;;
        valgomat)
            secret_path="secret/applications/valg-valgomat-analyse-mottak/${environment}/valgomat_analyse_db"
            ;;
        *)
            echo "no secret definition for $name."
            ;;
    esac

    if [ -z "$secret_path" ]; then
        echo "postgres hotel config with name \"$name\" not found"
        return
    fi

    # check login status and log in if not
    vault token lookup &>/dev/null
    if [ $? -eq 2 ]; then
        echo "Logging in to vault..."
        vault login -method=oidc 1>/dev/null
    fi

    secret=$(vault kv get -format=json "$secret_path" | jq .data)
    connection_string=$(echo "$secret" | jq -r .db_connection_string)

    if [ $# -gt 2 ]; then
        psql "$connection_string" "${@:3}"
    else
        pgcli "$connection_string"
    fi
}