load test_helper

@test "Ignore files with deprecated _content-type" {
  run run_vale "$BATS_TEST_FILENAME" ignore_content_type.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore files with deprecated _module-type" {
  run run_vale "$BATS_TEST_FILENAME" ignore_module_type.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore files with _mod-docs-content-type" {
  run run_vale "$BATS_TEST_FILENAME" ignore_module_type.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore files with _mod-docs-content-type after title" {
  run run_vale "$BATS_TEST_FILENAME" ignore_preceding_content.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore files withe the IGNORE content type" {
  run run_vale "$BATS_TEST_FILENAME" ignore_ignored_files.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report files with _mod-docs-content-type in line comment" {
  run run_vale "$BATS_TEST_FILENAME" report_comments.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_comments.adoc:1:1:AsciiDocDITA.ContentType:The '_mod-docs-content-type' attribute definition is missing." ]
}

@test "Report files with _mod-docs-content-type without value" {
  run run_vale "$BATS_TEST_FILENAME" report_missing_value.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_missing_value.adoc:1:1:AsciiDocDITA.ContentType:The '_mod-docs-content-type' attribute definition is missing." ]
}

@test "Report files without _mod-docs-content-type" {
  run run_vale "$BATS_TEST_FILENAME" report_missing_type.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_missing_type.adoc:1:1:AsciiDocDITA.ContentType:The '_mod-docs-content-type' attribute definition is missing." ]
}
