load test_helper

@test "Ignore block titles inside of block comments" {
  run run_vale "$BATS_TEST_FILENAME" ignore_comments.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore block titles inside of code blocks" {
  run run_vale "$BATS_TEST_FILENAME" ignore_code_blocks.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore block titles in other content types" {
  run run_vale "$BATS_TEST_FILENAME" ignore_other_modules.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore block titles in undefined content types" {
  run run_vale "$BATS_TEST_FILENAME" ignore_unknown_modules.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore supported block titles" {
  run run_vale "$BATS_TEST_FILENAME" ignore_supported_titles.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore block titles for examples, images, and tables" {
  run run_vale "$BATS_TEST_FILENAME" ignore_examples_images_tables.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore supported block titles with trailing spaces" {
  run run_vale "$BATS_TEST_FILENAME" ignore_trailing_spaces.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore steps that have similar syntax to block titles" {
  run run_vale "$BATS_TEST_FILENAME" ignore_steps.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore nested block titles" {
  run run_vale "$BATS_TEST_FILENAME" ignore_nested_titles.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report block titles in procedures with deprecated _content-type" {
  run run_vale "$BATS_TEST_FILENAME" report_content_type.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_content_type.adoc:8:1:AsciiDocDITA.TaskTitle:Unsupported titles cannot be mapped to DITA tasks." ]
}

@test "Report block titles in procedures with deprecated _module-type" {
  run run_vale "$BATS_TEST_FILENAME" report_module_type.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_module_type.adoc:8:1:AsciiDocDITA.TaskTitle:Unsupported titles cannot be mapped to DITA tasks." ]
}

@test "Report unsupported block titles in procedure modules" {
  run run_vale "$BATS_TEST_FILENAME" report_unknown_titles.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 2 ]
  [ "${lines[0]}" = "report_unknown_titles.adoc:8:1:AsciiDocDITA.TaskTitle:Unsupported titles cannot be mapped to DITA tasks." ]
  [ "${lines[1]}" = "report_unknown_titles.adoc:12:1:AsciiDocDITA.TaskTitle:Unsupported titles cannot be mapped to DITA tasks." ]
}
