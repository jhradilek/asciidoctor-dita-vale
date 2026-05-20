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
  run run_vale "$BATS_TEST_FILENAME" ignore_valid_examples.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore files withe the IGNORE content type" {
  run run_vale "$BATS_TEST_FILENAME" ignore_ignored_files.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report example blocks in other blocks" {
  run run_vale "$BATS_TEST_FILENAME" report_example_in_block.adoc
  [ "$status" -eq 1 ]
  [ "${#lines[@]}" -eq 2 ]
  [ "${lines[0]}" = "report_example_in_block.adoc:5:1:AsciiDocDITA.ExampleBlock:Examples can not be inside of other blocks in DITA." ]
  [ "${lines[1]}" = "report_example_in_block.adoc:14:1:AsciiDocDITA.ExampleBlock:Examples can not be inside of other blocks in DITA." ]
}

@test "Report example blocks in list items" {
  run run_vale "$BATS_TEST_FILENAME" report_example_in_list.adoc
  [ "$status" -eq 1 ]
  [ "${#lines[@]}" -eq 3 ]
  [ "${lines[0]}" = "report_example_in_list.adoc:5:1:AsciiDocDITA.ExampleBlock:Examples can not be inside of other blocks in DITA." ]
  [ "${lines[1]}" = "report_example_in_list.adoc:12:1:AsciiDocDITA.ExampleBlock:Examples can not be inside of other blocks in DITA." ]
  [ "${lines[2]}" = "report_example_in_list.adoc:19:1:AsciiDocDITA.ExampleBlock:Examples can not be inside of other blocks in DITA." ]
}

@test "Report example blocks in sections" {
  run run_vale "$BATS_TEST_FILENAME" report_example_in_section.adoc
  [ "$status" -eq 1 ]
  [ "${#lines[@]}" -eq 2 ]
  [ "${lines[0]}" = "report_example_in_section.adoc:4:1:AsciiDocDITA.ExampleBlock:Examples can not be inside of other blocks in DITA." ]
  [ "${lines[1]}" = "report_example_in_section.adoc:7:1:AsciiDocDITA.ExampleBlock:Examples can not be inside of other blocks in DITA." ]
}
