class Endpoints {
  static String baseURL = 'https://akgecerp.edumarshal.com';

  static String token = '$baseURL/Token';
  static String securityToken = '$baseURL/api/SecurityToken';

  static String userDetails = '$baseURL/api/User/GetByUserId';
  static String orgDetails = '$baseURL/api/Organization/GetByOrganizationId';
  static String attendanceDetails =
      '$baseURL/api/SubjectAttendance/GetPresentAbsentStudent';
  static String batchDetails = '$baseURL/api/SubjectAttendance';
  static String subjectDetails = '$baseURL/api/Subject';

  static String forgotPassword = '$baseURL/api/ForgotPassword';
  static String changePassword = '$baseURL/api/ChangePassword/changepassword?';
  static String fileBlob = '$baseURL/api/fileblob';
}
