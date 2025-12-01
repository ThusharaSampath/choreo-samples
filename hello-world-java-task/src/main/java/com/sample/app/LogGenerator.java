package com.sample.app;

/**
 * Utility class to generate log output during Maven build for pipeline load testing
 */
public class LogGenerator {
    public static void main(String[] args) {
        System.out.println("=== Build Log Generation Started - Generating 3500 lines for pipeline load testing ===");
        System.out.println("");
        
        for (int i = 1; i <= 3500; i++) {
            int memory = 500 + (i % 1000);
            String status = (i % 100 == 0) ? "CHECKPOINT" : "OK";
            String component = (i % 3 == 0) ? "compiler" : (i % 3 == 1) ? "resources" : "processor";
            
            System.out.println(String.format(
                "[BUILD-LOG-%d] Step %d/3500 | %s | %s | %dMB",
                i, i, component, status, memory
            ));
            
            // Flush output buffer every 100 lines to ensure logs are written
            if (i % 100 == 0) {
                System.out.flush();
                System.out.println(String.format("  [PROGRESS] %.1f%% complete | %d remaining", 
                    (i / 3500.0) * 100, 3500 - i));
            }
        }
        
        System.out.println("");
        System.out.println("=== Build Log Generation Complete - 3500 lines generated successfully ===");
        System.out.flush();
    }
}
