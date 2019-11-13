package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {

//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016092800618163";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDU+IpmC+w6aXJPvM3Oe+btkiMUAffnOWqyjZne590vEGuDYrgSuD1FIvwWInpJ8RqfOMnw7DtgOwEb8kizHD3l40PvIr0a5DfEaUVSSwdyM3uoQvQiHnQhx3zps7UqtA65oe0iTvJx93tsQgJwK8+hZbRj/VRkBoJM7UFdjD7aO/mcwLHqQA1wtrFqb2yTXFlZPBvou0sbNUnYlSr3gGxrvZSST21eNk6lHRP35nE1v7SfQR6q8twi9vbqJhDnshQUZHyQCM5Xw/nIN1zjAiWjf9w1zwdW22WHLRqf5+4A7h8R/xOU+tpibAsZ60yoMkat7yBrPoPrU0FtI8B0ASwzAgMBAAECggEBAKrWEFbZe45DpcHWxxS6iTzLPD5BcfXWNgOy2NpZDjFBr6y+FMBXcDa0YJj04TnNITjV2g/bv6lqy3H6gVzD69cr3gPGzwDyTtXMSCJCM1/lcm1AAAwad7fdCROC53Gw7Br2jH037P2Es0ndDY2jZzOlnPWUcgymuAEzVHrRFF4DxYz9x/xuwjqITZ793HhawO0ytiygYahrRotOf9Tt7grxACqPJAgVhFdaLbc+MJjr4BxdzRNSyinOuLyOsiM80Po3CipQqHZFhFNouSSWh8lcBoOCFZ1LxD2pVB98gBxVA8Dv6jvdhDKQL/hBnZAGXt3jaqwQQv+dksGEQ0uxAGECgYEA7IeyAhuwUlDDbIgBE3SHcUYpI7TPP3Jl10CaN1vJ0gI4k9gQdSlIB7ItxLtmtdpI1el9TobmNIeeKTU3DG2hTXSBbW8LphIiX5ZTPwVYp44+n3w+4+yr2U1yvG75ZOwvyBudsfZc4WjdrABjygJL1PIr1fQVunQ55YTmSwn1W5ECgYEA5oBkPu2rc000roY2ho2ERjWGAJ2obz+pSiJYU1oy4+ZnvGn6kXY9PtY7Fwi+yMcB26pTnX3Pv4m77TO3cnFLrDYv7cezX8ftaNAFgn1n/BllGPv2SZX07gFNFdbmRNMYg75Y84JYajFYZ2e1Px48+Qn93pd1sT1SwpZVTlc7wYMCgYEAgSFX4mTBbz8eYasigz+UDhhSr2av2qCWztw7FUvsM9X4k2ZbHcuKwoDZEdWJrnBcYURWn79wAG+lvjOKOSPE8ydO3bLJNkIiN/M2wWomy1sR/znyj7aO31Sz9gHT7/At6d6Byj2I2ZrJonSYBhoY0knf+q+GCUQYs6BJpd/q7rECgYAkpuPJ0dcCZZNr8PF4ocYXt+kP7gHbdr7/h8iNsHkJHhj+r8dlG+0PMdeBiSV1HZfhCwtyro+7QDZ+uEuCShujTZZ/c9LE9zB8Cx/lKPXA83TM7TuzZcHlmpVcVKiW5w4t3LWeOuq+MAyDnM0INVGys/EHVQQk48BmKqtz4pEg6wKBgQCLWoJg0Ws3B/fC1HV+++kMQ/w3UDNLvNtooQVCV+QErx2p1aaMjTvelX25ybxKCXnksJ5eC2m0rACtFEGNEg0ITkdMlgL6EHDAVBKM++KDBZmopXjYMkZYB4umoMIy2iidynnELPDJW/U05zWDUvcqomu2sAotQ8KzX/oAb+3zTA==";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqK5oHSqkjc5BGtHO4481cCIy1rJzjlETuX/nbwoUt9VTHHQFCeOxPY05O/0vi0glmsRaVIsfuytXB6OyztTKgO4Y1SW0RV/2rxRPkNbfThRCwQKD+2Yi65vWxQYOQmq2995uF/rJXIFnVIyj/0Oqqcgd3ehlDUQcpITBMuWCp3YvHjk7zaTiJzL+necXYG20RssyuJmjvUMF99unl6sFfqanlxXJM1KA9LNC2FMUS26B69N//FCEK/lrHyh8FkCR/+ujbwLHPJ3BN1LR93fTmVNaVKQ44p6XFUnN5qVwY/WagQMXTtkaQqgzzIl2Acebtewv8eyYhavAqfSFe7n0ZQIDAQAB";

   /* // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://localhost:8090/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";
*/
    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://148.70.168.210:8080/productweb/Updatestate";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 支付宝网关
    public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /**
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}