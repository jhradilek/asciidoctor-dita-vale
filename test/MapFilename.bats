load test_helper

@test "Ignore content inside of line and block comments" {
  run run_vale "$BATS_TEST_FILENAME" ignore_comments.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore other content types" {
  run run_vale "$BATS_TEST_FILENAME" ignore_other_types.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore valid AsciiDoc maps" {
  run run_vale "$BATS_TEST_FILENAME" ignore_valid_map.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report file names with unsupported characters in maps" {
  run run_vale "$BATS_TEST_FILENAME" report_invalid_filenames.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 3 ]
  [ "${lines[0]}" = "report_invalid_filenames.adoc:7:1:AsciiDocDITA.MapFilename:Use only lowercase alphanumeric characters and hyphens (a-z, 0-9, and -) in file names." ]
  [ "${lines[1]}" = "report_invalid_filenames.adoc:9:1:AsciiDocDITA.MapFilename:Use only lowercase alphanumeric characters and hyphens (a-z, 0-9, and -) in file names." ]
  [ "${lines[2]}" = "report_invalid_filenames.adoc:11:1:AsciiDocDITA.MapFilename:Use only lowercase alphanumeric characters and hyphens (a-z, 0-9, and -) in file names." ]
}

@test "Report file names with unsupported characters in assemblies" {
  run run_vale "$BATS_TEST_FILENAME" report_assembly_includes.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 3 ]
  [ "${lines[0]}" = "report_assembly_includes.adoc:12:1:AsciiDocDITA.MapFilename:Use only lowercase alphanumeric characters and hyphens (a-z, 0-9, and -) in file names." ]
  [ "${lines[1]}" = "report_assembly_includes.adoc:14:1:AsciiDocDITA.MapFilename:Use only lowercase alphanumeric characters and hyphens (a-z, 0-9, and -) in file names." ]
  [ "${lines[2]}" = "report_assembly_includes.adoc:16:1:AsciiDocDITA.MapFilename:Use only lowercase alphanumeric characters and hyphens (a-z, 0-9, and -) in file names." ]
}
