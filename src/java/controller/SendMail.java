/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
/**
 *
 * @author khanh
 */
public class SendMail {
    public void sendConfirmationEmail(String email, String verificationCode) {
        // Cấu hình các thuộc tính của JavaMail
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        final String username = "nguyenkhangdemo@gmail.com";
        final String password = "gxbxfadxjnjvxrfp";

        // Tạo phiên gửi email
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // Check if the email address is not null or empty
            if (email != null && !email.isEmpty()) {
                // Tạo đối tượng MimeMessage
                Message message = new MimeMessage(session);

                // Đặt thông tin người gửi
                message.setFrom(new InternetAddress("ShopOnline"));

                // Đặt thông tin người nhận
                message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));

                // Đặt tiêu đề email
                message.setSubject("ShopOnline Registration Verification");

                // Đặt nội dung email
                message.setText("Shop Online, Hello! \nYour verification code is:  " + verificationCode + "  Verification code will expire in 5 minutes." + "\nPlease click the following link to verify your account:   http://localhost:9999/onlineshopping/home");

                // Gửi email
                Transport.send(message);
            } else {
                // Handle the case when the email address is null or empty
                System.out.println("Invalid email address.");
            }
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    public String generateVerificationCode() {
        // Tạo mã xác nhận ngẫu nhiên
        Random random = new Random();
        int code = random.nextInt(900000) + 100000;
        return String.valueOf(code);
    }
}
