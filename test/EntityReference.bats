load test_helper

@test "Ignore character entity references inside of comments" {
  run run_vale "$BATS_TEST_FILENAME" ignore_comments.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore numeric character references" {
  run run_vale "$BATS_TEST_FILENAME" ignore_numeric_references.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore output redirections" {
  run run_vale "$BATS_TEST_FILENAME" ignore_redirections.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore supported character entity references" {
  run run_vale "$BATS_TEST_FILENAME" ignore_supported_entities.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore code blocks with replacements disabled" {
  run run_vale "$BATS_TEST_FILENAME" ignore_code_blocks.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report unsupported character entity references" {
  run run_vale "$BATS_TEST_FILENAME" report_entity_references.adoc
  [ "$status" -ne 0 ]
  [ "${#lines[@]}" -eq 2 ]
  [ "${lines[0]}" = "report_entity_references.adoc:3:3:AsciiDocDITA.EntityReference:HTML character entity references are not supported in DITA." ]
  [ "${lines[1]}" = "report_entity_references.adoc:4:3:AsciiDocDITA.EntityReference:HTML character entity references are not supported in DITA." ]
}

@test "Report all character entity references on single line" {
  run run_vale "$BATS_TEST_FILENAME" report_multiple_references.adoc
  [ "$status" -ne 0 ]
  [ "${#lines[@]}" -eq 4 ]
  [ "${lines[0]}" = "report_multiple_references.adoc:3:3:AsciiDocDITA.EntityReference:HTML character entity references are not supported in DITA." ]
  [ "${lines[1]}" = "report_multiple_references.adoc:3:36:AsciiDocDITA.EntityReference:HTML character entity references are not supported in DITA." ]
  [ "${lines[2]}" = "report_multiple_references.adoc:3:94:AsciiDocDITA.EntityReference:HTML character entity references are not supported in DITA." ]
  [ "${lines[3]}" = "report_multiple_references.adoc:3:125:AsciiDocDITA.EntityReference:HTML character entity references are not supported in DITA." ]
}

@test "Report code blocks with replacements enabled" {
  run run_vale "$BATS_TEST_FILENAME" report_code_blocks.adoc
  [ "$status" -ne 0 ]
  [ "${#lines[@]}" -eq 4 ]
  [ "${lines[0]}" = "report_code_blocks.adoc:6:22:AsciiDocDITA.EntityReference:HTML character entity references are not supported in DITA." ]
  [ "${lines[1]}" = "report_code_blocks.adoc:12:22:AsciiDocDITA.EntityReference:HTML character entity references are not supported in DITA." ]
  [ "${lines[2]}" = "report_code_blocks.adoc:18:22:AsciiDocDITA.EntityReference:HTML character entity references are not supported in DITA." ]
  [ "${lines[3]}" = "report_code_blocks.adoc:24:22:AsciiDocDITA.EntityReference:HTML character entity references are not supported in DITA." ]
}
