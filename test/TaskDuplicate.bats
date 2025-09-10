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

@test "Ignore block titles assigned to examples, figures, and tables" {
  run run_vale "$BATS_TEST_FILENAME" ignore_block_titles.adoc
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

@test "Ignore steps that have similar syntax to block titles" {
  run run_vale "$BATS_TEST_FILENAME" ignore_steps.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report exact duplicates of block titles in procedures" {
  run run_vale "$BATS_TEST_FILENAME" report_same_title.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 6 ]
  [ "${lines[0]}" = "report_same_title.adoc:12:1:AsciiDocDITA.TaskDuplicate:Duplicate titles cannot be mapped to DITA tasks." ]
  [ "${lines[1]}" = "report_same_title.adoc:20:1:AsciiDocDITA.TaskDuplicate:Duplicate titles cannot be mapped to DITA tasks." ]
  [ "${lines[2]}" = "report_same_title.adoc:28:1:AsciiDocDITA.TaskDuplicate:Duplicate titles cannot be mapped to DITA tasks." ]
  [ "${lines[3]}" = "report_same_title.adoc:36:1:AsciiDocDITA.TaskDuplicate:Duplicate titles cannot be mapped to DITA tasks." ]
  [ "${lines[4]}" = "report_same_title.adoc:44:1:AsciiDocDITA.TaskDuplicate:Duplicate titles cannot be mapped to DITA tasks." ]
  [ "${lines[5]}" = "report_same_title.adoc:52:1:AsciiDocDITA.TaskDuplicate:Duplicate titles cannot be mapped to DITA tasks." ]
}

@test "Report duplicate variants of block titles in procedures" {
  run run_vale "$BATS_TEST_FILENAME" report_title_variants.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 6 ]
  [ "${lines[0]}" = "report_title_variants.adoc:12:1:AsciiDocDITA.TaskDuplicate:Duplicate titles cannot be mapped to DITA tasks." ]
  [ "${lines[1]}" = "report_title_variants.adoc:24:1:AsciiDocDITA.TaskDuplicate:Duplicate titles cannot be mapped to DITA tasks." ]
  [ "${lines[2]}" = "report_title_variants.adoc:28:1:AsciiDocDITA.TaskDuplicate:Duplicate titles cannot be mapped to DITA tasks." ]
  [ "${lines[3]}" = "report_title_variants.adoc:36:1:AsciiDocDITA.TaskDuplicate:Duplicate titles cannot be mapped to DITA tasks." ]
  [ "${lines[4]}" = "report_title_variants.adoc:40:1:AsciiDocDITA.TaskDuplicate:Duplicate titles cannot be mapped to DITA tasks." ]
  [ "${lines[5]}" = "report_title_variants.adoc:48:1:AsciiDocDITA.TaskDuplicate:Duplicate titles cannot be mapped to DITA tasks." ]
}
