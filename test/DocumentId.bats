load test_helper

@test "Ignore files with valid document ids" {
  run run_vale "$BATS_TEST_FILENAME" ignore_valid_id.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore files with document ids in single quotes" {
  run run_vale "$BATS_TEST_FILENAME" ignore_single_quotes.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore files with document ids without quotes" {
  run run_vale "$BATS_TEST_FILENAME" ignore_no_quotes.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore files with valid document ids that use shorthand syntax" {
  run run_vale "$BATS_TEST_FILENAME" ignore_shorthand_syntax.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore files with valid document ids that use block syntax" {
  run run_vale "$BATS_TEST_FILENAME" ignore_block_syntax.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore files with valid contents in between" {
  run run_vale "$BATS_TEST_FILENAME" ignore_valid_blocks.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report document ids that only appear in code blocks" {
  run run_vale "$BATS_TEST_FILENAME" report_code_blocks.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_code_blocks.adoc:8:1:AsciiDocDITA.DocumentId:The document id assigned to the level 0 heading is missing." ]
}

@test "Report document ids that only appear in comments" {
  run run_vale "$BATS_TEST_FILENAME" report_comments.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_comments.adoc:8:1:AsciiDocDITA.DocumentId:The document id assigned to the level 0 heading is missing." ]
}

@test "Report ids followed by invalid blocks" {
  run run_vale "$BATS_TEST_FILENAME" report_invalid_blocks.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_invalid_blocks.adoc:6:1:AsciiDocDITA.DocumentId:The document id assigned to the level 0 heading is missing." ]
}

@test "Report missing document ids" {
  run run_vale "$BATS_TEST_FILENAME" report_missing_id.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_missing_id.adoc:3:1:AsciiDocDITA.DocumentId:The document id assigned to the level 0 heading is missing." ]
}

@test "Report missing document ids for conditional titles" {
  run run_vale "$BATS_TEST_FILENAME" report_conditional_title.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_conditional_title.adoc:3:1:AsciiDocDITA.DocumentId:The document id assigned to the level 0 heading is missing." ]
}
