load test_helper

@test "Ignore sections inside of block comments" {
  run run_vale "$BATS_TEST_FILENAME" ignore_comments.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore sections inside of code blocks" {
  run run_vale "$BATS_TEST_FILENAME" ignore_code_blocks.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore sections in other content types" {
  run run_vale "$BATS_TEST_FILENAME" ignore_other_modules.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore sections in undefined content types" {
  run run_vale "$BATS_TEST_FILENAME" ignore_unknown_modules.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report sections in procedures with deprecated _content-type" {
  run run_vale "$BATS_TEST_FILENAME" report_content_type.adoc
  [ "$status" -ne 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_content_type.adoc:9:1:AsciiDocDITA.TaskSection:Sections are not allowed in DITA tasks." ]
}

@test "Report sections in procedures with deprecated _module-type" {
  run run_vale "$BATS_TEST_FILENAME" report_module_type.adoc
  [ "$status" -ne 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_module_type.adoc:9:1:AsciiDocDITA.TaskSection:Sections are not allowed in DITA tasks." ]
}

@test "Report sections in procedure modules" {
  run run_vale "$BATS_TEST_FILENAME" report_sections.adoc
  [ "$status" -ne 0 ]
  [ "${#lines[@]}" -eq 3 ]
  [ "${lines[0]}" = "report_sections.adoc:9:1:AsciiDocDITA.TaskSection:Sections are not allowed in DITA tasks." ]
  [ "${lines[1]}" = "report_sections.adoc:14:1:AsciiDocDITA.TaskSection:Sections are not allowed in DITA tasks." ]
  [ "${lines[2]}" = "report_sections.adoc:19:1:AsciiDocDITA.TaskSection:Sections are not allowed in DITA tasks." ]
}
