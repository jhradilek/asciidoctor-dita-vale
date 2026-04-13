load test_helper

@test "Ignore character replacement attribute references" {
  run run_vale "$BATS_TEST_FILENAME" ignore_character_replacements.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}
@test "Ignore custom attribute references" {
  run run_vale "$BATS_TEST_FILENAME" ignore_custom_attributes.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore bash variables" {
  run run_vale "$BATS_TEST_FILENAME" ignore_bash_variables.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore spec file variables" {
  run run_vale "$BATS_TEST_FILENAME" ignore_spec_variables.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report intrinsic attribute references" {
  run run_vale "$BATS_TEST_FILENAME" report_intrinsic_attributes.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 33 ]
  [ "${lines[0]}" = "report_intrinsic_attributes.adoc:2:1:AsciiDocDITA.IntrinsicAttribute:{backend}" ]
  [ "${lines[1]}" = "report_intrinsic_attributes.adoc:3:1:AsciiDocDITA.IntrinsicAttribute:{backend-html}" ]
  [ "${lines[2]}" = "report_intrinsic_attributes.adoc:4:1:AsciiDocDITA.IntrinsicAttribute:{backend-html5-doctype-article}" ]
  [ "${lines[3]}" = "report_intrinsic_attributes.adoc:5:1:AsciiDocDITA.IntrinsicAttribute:{basebackend}" ]
  [ "${lines[4]}" = "report_intrinsic_attributes.adoc:6:1:AsciiDocDITA.IntrinsicAttribute:{basebackend-html}" ]
  [ "${lines[5]}" = "report_intrinsic_attributes.adoc:7:1:AsciiDocDITA.IntrinsicAttribute:{basebackend-html-doctype-article}" ]
  [ "${lines[6]}" = "report_intrinsic_attributes.adoc:8:1:AsciiDocDITA.IntrinsicAttribute:{docdate}" ]
  [ "${lines[7]}" = "report_intrinsic_attributes.adoc:9:1:AsciiDocDITA.IntrinsicAttribute:{docdatetime}" ]
  [ "${lines[8]}" = "report_intrinsic_attributes.adoc:10:1:AsciiDocDITA.IntrinsicAttribute:{docdir}" ]
  [ "${lines[9]}" = "report_intrinsic_attributes.adoc:11:1:AsciiDocDITA.IntrinsicAttribute:{docfile}" ]
  [ "${lines[10]}" = "report_intrinsic_attributes.adoc:12:1:AsciiDocDITA.IntrinsicAttribute:{docfilesuffix}" ]
  [ "${lines[11]}" = "report_intrinsic_attributes.adoc:13:1:AsciiDocDITA.IntrinsicAttribute:{docname}" ]
  [ "${lines[12]}" = "report_intrinsic_attributes.adoc:14:1:AsciiDocDITA.IntrinsicAttribute:{doctime}" ]
  [ "${lines[13]}" = "report_intrinsic_attributes.adoc:15:1:AsciiDocDITA.IntrinsicAttribute:{doctype-article}" ]
  [ "${lines[14]}" = "report_intrinsic_attributes.adoc:16:1:AsciiDocDITA.IntrinsicAttribute:{docyear}" ]
  [ "${lines[15]}" = "report_intrinsic_attributes.adoc:17:1:AsciiDocDITA.IntrinsicAttribute:{embedded}" ]
  [ "${lines[16]}" = "report_intrinsic_attributes.adoc:18:1:AsciiDocDITA.IntrinsicAttribute:{filetype}" ]
  [ "${lines[17]}" = "report_intrinsic_attributes.adoc:19:1:AsciiDocDITA.IntrinsicAttribute:{filetype-html}" ]
  [ "${lines[18]}" = "report_intrinsic_attributes.adoc:20:1:AsciiDocDITA.IntrinsicAttribute:{htmlsyntax}" ]
  [ "${lines[19]}" = "report_intrinsic_attributes.adoc:21:1:AsciiDocDITA.IntrinsicAttribute:{localdate}" ]
  [ "${lines[20]}" = "report_intrinsic_attributes.adoc:22:1:AsciiDocDITA.IntrinsicAttribute:{localdatetime}" ]
  [ "${lines[21]}" = "report_intrinsic_attributes.adoc:23:1:AsciiDocDITA.IntrinsicAttribute:{localtime}" ]
  [ "${lines[22]}" = "report_intrinsic_attributes.adoc:24:1:AsciiDocDITA.IntrinsicAttribute:{localyear}" ]
  [ "${lines[23]}" = "report_intrinsic_attributes.adoc:25:1:AsciiDocDITA.IntrinsicAttribute:{outdir}" ]
  [ "${lines[24]}" = "report_intrinsic_attributes.adoc:26:1:AsciiDocDITA.IntrinsicAttribute:{outfile}" ]
  [ "${lines[25]}" = "report_intrinsic_attributes.adoc:27:1:AsciiDocDITA.IntrinsicAttribute:{outfilesuffix}" ]
  [ "${lines[26]}" = "report_intrinsic_attributes.adoc:28:1:AsciiDocDITA.IntrinsicAttribute:{safe-mode-level}" ]
  [ "${lines[27]}" = "report_intrinsic_attributes.adoc:29:1:AsciiDocDITA.IntrinsicAttribute:{safe-mode-name}" ]
  [ "${lines[28]}" = "report_intrinsic_attributes.adoc:30:1:AsciiDocDITA.IntrinsicAttribute:{safe-mode-unsafe}" ]
  [ "${lines[29]}" = "report_intrinsic_attributes.adoc:31:1:AsciiDocDITA.IntrinsicAttribute:{safe-mode-safe}" ]
  [ "${lines[30]}" = "report_intrinsic_attributes.adoc:32:1:AsciiDocDITA.IntrinsicAttribute:{safe-mode-server}" ]
  [ "${lines[31]}" = "report_intrinsic_attributes.adoc:33:1:AsciiDocDITA.IntrinsicAttribute:{safe-mode-secure}" ]
  [ "${lines[32]}" = "report_intrinsic_attributes.adoc:34:1:AsciiDocDITA.IntrinsicAttribute:{user-home}" ]
}
