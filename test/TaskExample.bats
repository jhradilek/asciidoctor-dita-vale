load test_helper

@test "Ignore example blocks inside of line and block comments" {
  run run_vale "$BATS_TEST_FILENAME" ignore_comments.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore example blocks inside of code blocks" {
  run run_vale "$BATS_TEST_FILENAME" ignore_code_blocks.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore admonitions that use the same delimiter as example blocks" {
  run run_vale "$BATS_TEST_FILENAME" ignore_admonitions.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore supported example blocks" {
  run run_vale "$BATS_TEST_FILENAME" ignore_single_example.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore supported example blocks with redundant markup" {
  run run_vale "$BATS_TEST_FILENAME" ignore_duplicate_markup.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore example blocks in other content types" {
  run run_vale "$BATS_TEST_FILENAME" ignore_other_modules.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report extra example blocks" {
  run run_vale "$BATS_TEST_FILENAME" report_multiple_examples.adoc
  [ "$status" -eq 1 ]
  [ "${#lines[@]}" -eq 2 ]
  [ "${lines[0]}" = "report_multiple_examples.adoc:7:1:AsciiDocDITA.TaskExample:Examples are allowed only once in DITA tasks." ]
  [ "${lines[1]}" = "report_multiple_examples.adoc:11:1:AsciiDocDITA.TaskExample:Examples are allowed only once in DITA tasks." ]
}
