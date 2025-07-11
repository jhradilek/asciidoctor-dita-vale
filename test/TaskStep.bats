load test_helper

@test "Ignore content inside of line and block comments" {
  run run_vale "$BATS_TEST_FILENAME" ignore_comments.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore content in other sections" {
  run run_vale "$BATS_TEST_FILENAME" ignore_other_sections.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore attribute lists" {
  run run_vale "$BATS_TEST_FILENAME" ignore_attribute_lists.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore conditional directives" {
  run run_vale "$BATS_TEST_FILENAME" ignore_conditionals.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore valid lines with all content variations" {
  run run_vale "$BATS_TEST_FILENAME" ignore_valid_lines.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report content other than steps in procedures" {
  run run_vale "$BATS_TEST_FILENAME" report_non_steps.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 2 ]
  [ "${lines[0]}" = "report_non_steps.adoc:6:1:AsciiDocDITA.TaskStep:Content other than a single list cannot be mapped to DITA tasks." ]
  [ "${lines[1]}" = "report_non_steps.adoc:10:1:AsciiDocDITA.TaskStep:Content other than a single list cannot be mapped to DITA tasks." ]
}

@test "Report content immediately after a code block" {
  run run_vale "$BATS_TEST_FILENAME" report_after_code.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_after_code.adoc:12:1:AsciiDocDITA.TaskStep:Content other than a single list cannot be mapped to DITA tasks." ]
}
