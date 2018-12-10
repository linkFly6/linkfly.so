import { leftPad } from './format'
import * as moment from 'moment'

/**
 * 时间格式化
 * @example format 支持下面的格式：
 * 年份：dateFormat(date, yyyy) => 2018
 * 2 位数月份：dateFormat(date, MM) => 02
 * 1 位数月份：dateFormat(date, M) => 2
 * 2 位数日期：dateFormat(date, dd) => 07
 * 1 位数日期：dateFormat(date, d) => 7
 * 2 位数 24 小时：dateFormat(date, HH) => 09
 * 1 位数 24 小时：dateFormat(date, H) => 11
 * 2 位数 12 小时(上下午会在小时前加 AM/PM)：dateFormat(date, hh) => 02
 * 1 位数 12 小时(上下午会在小时前加 AM/PM)：dateFormat(date, h) => 2
 * 2 位数分钟：dateFormat(date, mm) => 08
 * 1 位数分钟：dateFormat(date, mm) => 8
 * 2 位数秒：dateFormat(date, ss) => 06
 * 1 位数秒：dateFormat(date, s) => 6
 * 3 位数毫秒：dateFormat(date, S) => 000
 * 季度：dateFormat(date, q) => 1
 * @param date 
 * @param format 
 */
export const dateFormat = (date: Date | string | number, format = 'yyyy-MM-dd') => {
  if (!date) return ''
  let converDate: Date
  if (!(date instanceof Date)) {
    let tmp: any = String(date).replace(/\-/g, '/')
    if (!isNaN(tmp)) {
      tmp = parseInt(tmp, 10)
    }
    converDate = new Date(tmp)
  } else {
    converDate = date
  }
  if (!(converDate! instanceof Date)) return ''
  converDate = converDate! as Date
  const hours = converDate.getHours()
  const hours12 = hours > 11 ? 'PM' + (hours - 12) : 'AM' + hours // 12 小时制 1 位数
  const hours12double = hours > 11 ? 'PM ' + leftPad(hours - 12, 2) : 'AM ' + leftPad(hours, 2) // 12 小时制 2 位数

  const o: any = {
    'M+': converDate.getMonth() + 1, // 月份
    'd+': converDate.getDate(), // 日
    'H+': converDate.getHours(), // 小时
    'm+': converDate.getMinutes(), // 分
    's+': converDate.getSeconds(), // 秒
    'q+': Math.floor((converDate.getMonth() + 3) / 3), // 季度
    'S': converDate.getMilliseconds(), // 毫秒
  }

  format = format
    .replace('yyyy', converDate.getFullYear() as any) // 4位数年份
    .replace('hh', hours12double) // 12 小时制 2 位数
    .replace('h', hours12) // 12 小时制 1 位数

  for (const k in o) {
    if (new RegExp('(' + k + ')').test(format)) {
      format = format.replace(
        RegExp.$1,
        (
          RegExp.$1.length === 1) ?
          (o[k]) : (('00' + o[k]).substr(('' + o[k]).length)
          ))
    }
  }
  return format
}

// 当前时间固定时间戳 2018-01-30 00:00:00（一定要 00:00:00，否则计算可能存在误差）
const lockDateNow = 1517241600000

/**
 * 转换一个秒数到时间，例如：60 => 00:01:00
 * @param seconds 
 */
export const parseTime = (seconds: number) => {
  const date = new Date()
  date.setTime(lockDateNow)
  date.setSeconds(seconds)
  return dateFormat(date, 'HH:mm:ss')
}

/**
 * 时间转本地时间
 * @example 2018-12-10 18:31:37 => 2分钟前/刚才/今天 18:31
 * @param date 
 */
export const date2Local = (date: string | number) => {
  const timespan = moment().diff(date)
  if (timespan <= 12e4) { // 2分钟
    return '刚才'
  }
  if (timespan <= 864e5) { // 1 天
    return moment(date).format('今天 HH:mm')
  }
  if (timespan <= 1728e5) { // 2天
    return moment(date).format('昨天 HH:mm')
  }
  if (timespan <= 2592e5) { // 3天
    return moment(date).format('前天 HH:mm')
  }
  return moment(date).format('YYYY-MM-DD HH:mm')
}

/**
 * 将时间转化为日
 * @example 2018-12-10 18:32:01 => 今天、昨天、前天
 * @param date 
 */
export const date2day = (date: string | number) => {
  const timespan = moment().diff(date)
  if (timespan <= 12e4) { // 2分钟
    return '刚才'
  }
  if (timespan <= 864e5) { // 1 天
    return moment(date).format('今天')
  }
  if (timespan <= 1728e5) { // 2天
    return moment(date).format('昨天')
  }
  if (timespan <= 2592e5) { // 3天
    return moment(date).format('前天')
  }
  return moment(date).format('DD日')
}
