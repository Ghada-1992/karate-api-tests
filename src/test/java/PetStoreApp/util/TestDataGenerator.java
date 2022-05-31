package PetStoreApp.util;

import java.util.UUID;

public class TestDataGenerator {
    public static String uuid() {
        return UUID.randomUUID().toString();
    }

    public static int randomNumber(int min, int max) {
        return (int) (Math.random() * (max - min + 1) + min);
    }

}