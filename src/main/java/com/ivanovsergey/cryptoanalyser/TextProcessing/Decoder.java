package com.ivanovsergey.cryptoanalyser.TextProcessing;

import java.io.InputStream;

public class Decoder {

    private Decoder() {
    }

    public static void decryptionWithKey(String pathFrom, String pathTo, int key) {

        Coder.encryption(pathFrom, pathTo, -key);
    }

    public static void manualDecryptionBruteForce(String pathFrom, String pathTo) {

        for (int key = 1; key < TextProcessing.choiceOfAlphabet(TextProcessing.language).length; key++) {

            String pathKey = getNewFileName(key, pathTo);
            Coder.encryption(pathFrom, pathKey, key);
        }
    }

    public static void autoDecryptionBruteForce(String pathFrom, String pathTo) {

        for (int key = 1; key < TextProcessing.choiceOfAlphabet(TextProcessing.language).length; key++) {

            Coder.encryption(pathFrom, pathTo, key);

            if (Checks.autoSelectOfCorrectDecryption(pathTo)) {
                break;
            }
        }
    }

    public static void manualDecryptionWithStatistic(String pathFrom, String pathTo) {

        char[] chars = TextProcessing.getArrayGreatestFrequentLettersOfAlphabets(TextProcessing.language);
        int indexOfMostFrequentLetterOfText = TextProcessing.getIndex(TextProcessing.getMostFrequentLetterOfText(pathFrom),
                TextProcessing.language);

        for (int ind = 0; ind < chars.length; ind++) {

            int foundKey = indexOfMostFrequentLetterOfText
                    - TextProcessing.getIndex(chars[ind], TextProcessing.language);

            String pathKey = getNewFileName(foundKey, pathTo);

            decryptionWithKey(pathFrom, pathKey, foundKey);
        }
    }

    public static void autoDecryptionWithStatistic(String pathFrom, String pathTo) {

        char[] chars = TextProcessing.getArrayGreatestFrequentLettersOfAlphabets(TextProcessing.language);
        int indexOfMostFrequentLetterOfText = TextProcessing.getIndex(
                TextProcessing.getMostFrequentLetterOfText(pathFrom), TextProcessing.language);

        for (int ind = 0; ind < chars.length; ind++) {

            int indexOfMostFrequentLetterOfAlphabet = TextProcessing.getIndex(chars[ind], TextProcessing.language);
            int foundKey = indexOfMostFrequentLetterOfText - indexOfMostFrequentLetterOfAlphabet;

            decryptionWithKey(pathFrom, pathTo, foundKey);

            if (Checks.autoSelectOfCorrectDecryption(pathTo)) {
                break;
            }
        }
    }

    public static String getNewFileName(int key, String pathTo) {
        return pathTo + System.getProperty("file.separator") + "Decode_key_" + key + ".txt";
    }

    public static void decryptionWithKey(InputStream fileInputStream, StringBuilder stringBuilder, int key) {

        Coder.encryption(fileInputStream, stringBuilder, -key);
    }

    public static void manualDecryptionBruteForce(InputStream fileInputStream, StringBuilder stringBuilder) {

        for (int key = 1; key < TextProcessing.choiceOfAlphabet(TextProcessing.language).length; key++) {
            stringBuilder.append("\tKey = " + key + "\n");
            Coder.encryption(fileInputStream, stringBuilder, key);
            stringBuilder.append("\n\n");
        }
    }

//    public static void autoDecryptionBruteForce(InputStream fileInputStream, StringBuilder stringBuilder) {
//
//        for (int key = 1; key < TextProcessing.choiceOfAlphabet(TextProcessing.language).length; key++) {
//
//            Coder.encryption(fileInputStream, stringBuilder, key);
//
//            if (Checks.autoSelectOfCorrectDecryption(pathTo)) {
//                break;
//            }
//        }
//    }

    public static void manualDecryptionWithStatistic(InputStream fileInputStream, StringBuilder stringBuilder) {

        char[] chars = TextProcessing.getArrayGreatestFrequentLettersOfAlphabets(TextProcessing.language);
        int indexOfMostFrequentLetterOfText = TextProcessing.getIndex(TextProcessing.getMostFrequentLetterOfText(fileInputStream),
                TextProcessing.language);

        for (int ind = 0; ind < chars.length; ind++) {

            int foundKey = indexOfMostFrequentLetterOfText
                    - TextProcessing.getIndex(chars[ind], TextProcessing.language);

            decryptionWithKey(fileInputStream, stringBuilder, foundKey);
        }
    }
}
