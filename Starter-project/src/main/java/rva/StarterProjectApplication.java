package rva;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

// GitHub Classroom Invite Link --> https://classroom.github.com/a/PgzNRc2E

/*anotacija -oznacava klasu koja je zaduzena za pokretanje programa tj sadrzi
  main metodu i mora biti u root paketu, sastoji se od 3 anotacije ustvari
 */
@SpringBootApplication
public class StarterProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(StarterProjectApplication.class, args); 
	}

}
