load test_helper

@test "Ignore block titles inside of line and block comments" {
  run run_vale "$BATS_TEST_FILENAME" ignore_comments.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore block titles inside of code blocks" {
  run run_vale "$BATS_TEST_FILENAME" ignore_code_blocks.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore steps that have similar syntax to block titles" {
  run run_vale "$BATS_TEST_FILENAME" ignore_steps.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore table cells that have similar syntax to block titles" {
  run run_vale "$BATS_TEST_FILENAME" ignore_table_cells.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore supported block titles in procedure modules" {
  run run_vale "$BATS_TEST_FILENAME" ignore_procedue_titles.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore additional resources in all modules" {
  run run_vale "$BATS_TEST_FILENAME" ignore_additional_resources.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore supported block titles" {
  run run_vale "$BATS_TEST_FILENAME" ignore_block_titles.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report unsupported block titles" {
  run run_vale "$BATS_TEST_FILENAME" report_block_titles.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 3 ]
  [ "${lines[0]}" = "report_block_titles.adoc:2:1:AsciiDocDITA.BlockTitle:Block titles can only be assigned to examples, figures, and tables in DITA." ]
  [ "${lines[1]}" = "report_block_titles.adoc:5:1:AsciiDocDITA.BlockTitle:Block titles can only be assigned to examples, figures, and tables in DITA." ]
  [ "${lines[2]}" = "report_block_titles.adoc:8:1:AsciiDocDITA.BlockTitle:Block titles can only be assigned to examples, figures, and tables in DITA." ]
}
