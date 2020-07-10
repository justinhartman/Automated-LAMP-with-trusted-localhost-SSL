#!/usr/bin/env bats

setup ()
{
    load globals
    echo "${NOW}: ${BATS_TEST_NAME}" >> "${LOG}"
}

@test "change file and folder ownership" {
    folder_ownership ()
    {
        printf "${GRY}%s\\n" "${TOP}"
        printf '* %-76s %s\n' "Setting correct folder permissions to your user account for" "*"
        printf '* %-76s %s\n' "the application folders." "*"
        printf "%s${NOC}\\n\\n" "${BOTTOM}"
        chown -R "${username}:${group}" "${websites}/${domain}"
        ls -lha
        echo -e "\\n${GRN}\\xE2\\x9C\\x94${NOC} ${CYA}Successfully set folder permissions recursively on ${websites}/${domain}.${NOC}\\n"
    }
    # Execute the test
    run folder_ownership
    [ "${lines[6]}" = "✔ Successfully set ${username}:${group} permissions to ${websites}/${domain}" ]
    [ "$status" -eq 0 ]
}
