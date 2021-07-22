package Utils;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class jpaUtils {
	private static EntityManagerFactory factory;

	public static EntityManager getEntityManager() {
		if (factory == null || !factory.isOpen()) {
			factory = Persistence.createEntityManagerFactory("Asm4");
		}

		return factory.createEntityManager();
	}

	public static void closeConect() {
		if (factory != null || factory.isOpen()) {
			factory.close();
		}
	}
}
