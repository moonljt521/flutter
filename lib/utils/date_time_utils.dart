

class DateTimeUtils {

  /**
   *  获取当前时间戳（Unix）
   */
  static int currentTimeMillis() {
    return new DateTime.now().millisecondsSinceEpoch;
  }

  /**
   * 时间戳转日期   yyyy - mm - dd
   */
  static String getDateTimeYYMMDD(String timestamp) {
    var format = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
    return format.year.toString() +"-"+format.month.toString() + "-" + format.day.toString();
  }

  /**
   * 时间戳转日期 mm - dd
   */
  static String getDateTimeMMDD(String timestamp) {
    var format = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
    return format.month.toString() + "-" + format.day.toString();
  }

  /**
   * DateTime 转换为 yyyy - mm - dd  格式
   */
  static String getFormat(DateTime datetime) {
   return "${datetime.year.toString()}-${datetime.month.toString().padLeft(2,'0')}-${datetime.day.toString().padLeft(2,'0')}";
  }

}