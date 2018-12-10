/**
 * 检测一个uri是否是正确 uri格式，判断了这些：
 * 不允许包含参数的 uri
 * 长度小于 60，不为空
 * tasaid.com | http://tasaid.com| www.tasaid.com
 * @param uri 
 */
export const checkUri = (uri: string) => {
  return uri
    && uri.trim().length <= 60
    // tslint:disable-next-line:max-line-length
    && /^((https:|http:)\/\/)?(([0-9a-z_!~*'().&=+$%-]+: )?[0-9a-z_!~*'().&=+$%-]+@)?(([0-9]{1,3}\.){3}[0-9]{1,3}|([0-9a-z_!~*'()-]+\.)*([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]\.[a-z]{2,6})(:[0-9]{1,4})?((\/?)|(\/[0-9a-z_!~*'().;?:@&=+$,%#-]+)+\/?)$/.test(uri)
}

/**
 * 验证 email 格式
 * @param email 
 */
export const checkEmail = (email: string) => {
  return email && /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/g.test(email)
}

