package gr.unipi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import java.awt.*;
import java.net.URL;

@SpringBootApplication
public class SqlProjectApplication {

    public static void main(String[] args) {
        SpringApplication.run(SqlProjectApplication.class, args);

        try {
            System.setProperty("java.awt.headless", "false");
            Desktop.getDesktop().browse(new URL("http://localhost:8080").toURI());
        } catch (Exception e) {
            System.out.println("CustomErrorController opening main screen in browser");
        }
    }
}
