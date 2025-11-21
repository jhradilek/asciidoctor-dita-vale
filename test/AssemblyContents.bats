load test_helper

@test "Ignore content inside of line and block comments" {
  run run_vale "$BATS_TEST_FILENAME" ignore_comments.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore conditional directives" {
  run run_vale "$BATS_TEST_FILENAME" ignore_conditionals.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore additional resources" {
  run run_vale "$BATS_TEST_FILENAME" ignore_additional_resources.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore supported attribute lists" {
  run run_vale "$BATS_TEST_FILENAME" ignore_attribute_lists.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore other content types" {
  run run_vale "$BATS_TEST_FILENAME" ignore_other_modules.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore valid assemblies" {
  run run_vale "$BATS_TEST_FILENAME" ignore_attribute_lists.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report code blocks between or after includes" {
  run run_vale "$BATS_TEST_FILENAME" report_code_blocks.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_code_blocks.adoc:6:1:AsciiDocDITA.AssemblyContents:Content other than additional resources cannot follow include directives." ]
}

@test "Report invalid lines between or after includes" {
  run run_vale "$BATS_TEST_FILENAME" report_invalid_lines.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_invalid_lines.adoc:6:1:AsciiDocDITA.AssemblyContents:Content other than additional resources cannot follow include directives." ]
}

@test "Report unsupported attribute lists between or after includes" {
  run run_vale "$BATS_TEST_FILENAME" report_attribute_lists.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_attribute_lists.adoc:6:1:AsciiDocDITA.AssemblyContents:Content other than additional resources cannot follow include directives." ]
}

@test "Report invalid sections after additional resources" {
  run run_vale "$BATS_TEST_FILENAME" report_invalid_sections.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_invalid_sections.adoc:10:1:AsciiDocDITA.AssemblyContents:Content other than additional resources cannot follow include directives." ]
}
