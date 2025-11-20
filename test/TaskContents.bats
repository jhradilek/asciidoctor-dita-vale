load test_helper

@test "Ignore files with valid procedure titles" {
  run run_vale "$BATS_TEST_FILENAME" ignore_valid_procedure.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore missing procedure titles in other content types" {
  run run_vale "$BATS_TEST_FILENAME" ignore_other_modules.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report procedure titles that only appear in code blocks" {
  run run_vale "$BATS_TEST_FILENAME" report_code_blocks.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_code_blocks.adoc:1:1:AsciiDocDITA.TaskContents:The '.Procedure' block title is missing." ]
}

@test "Report procedure titles that only appear in comments" {
  run run_vale "$BATS_TEST_FILENAME" report_comments.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_comments.adoc:1:1:AsciiDocDITA.TaskContents:The '.Procedure' block title is missing." ]
}

@test "Report missing procedure titles" {
  run run_vale "$BATS_TEST_FILENAME" report_missing_procedure.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_missing_procedure.adoc:1:1:AsciiDocDITA.TaskContents:The '.Procedure' block title is missing." ]
}
