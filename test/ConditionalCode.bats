load test_helper

@test "Ignore conditional directives in line comments" {
  run run_vale "$BATS_TEST_FILENAME" ignore_comments.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore escaped conditional directives" {
  run run_vale "$BATS_TEST_FILENAME" ignore_escapes.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore context attribute definitions" {
  run run_vale "$BATS_TEST_FILENAME" ignore_context_definitions.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore files withe the IGNORE content type" {
  run run_vale "$BATS_TEST_FILENAME" ignore_ignored_files.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report conditional directive variations" {
  run run_vale "$BATS_TEST_FILENAME" report_conditionals.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 7 ]
  [ "${lines[0]}" = "report_conditionals.adoc:3:1:AsciiDocDITA.ConditionalCode:ifndef::context[]" ]
  [ "${lines[1]}" = "report_conditionals.adoc:6:1:AsciiDocDITA.ConditionalCode:ifdef::context[]" ]
  [ "${lines[2]}" = "report_conditionals.adoc:11:1:AsciiDocDITA.ConditionalCode:ifdef::beginner-content[]" ]
  [ "${lines[3]}" = "report_conditionals.adoc:15:1:AsciiDocDITA.ConditionalCode:ifdef::beginner-content[A paragraph.]" ]
  [ "${lines[4]}" = "report_conditionals.adoc:17:1:AsciiDocDITA.ConditionalCode:ifndef::beginner-content[]" ]
  [ "${lines[5]}" = "report_conditionals.adoc:21:1:AsciiDocDITA.ConditionalCode:ifndef::beginner-content[A paragraph.]" ]
  [ "${lines[6]}" = "report_conditionals.adoc:23:1:AsciiDocDITA.ConditionalCode:ifeval::[\"{version-number}\" == \"1.0.0\"]" ]
}
