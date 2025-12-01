package com.sample.app;

import java.time.Instant;

/**
 * Utility class to generate log output during Maven build for pipeline load testing
 */
public class LogGenerator {
    public static void main(String[] args) {
        System.out.println("=== Build Log Generation Started - Generating 3500 lines for pipeline load testing ===");
        System.out.println("");
        
        for (int i = 1; i <= 3500; i++) {
            String timestamp = Instant.now().toString();
            int memory = 500 + (i % 1000);
            String status = (i % 100 == 0) ? "CHECKPOINT" : "OK";
            String component = (i % 3 == 0) ? "maven-compiler" : (i % 3 == 1) ? "maven-resources" : "maven-processor";
            
            System.out.println(String.format(
                "[BUILD-LOG-%d] %s - Processing build step %d of 3500 | Component: %s | Status: %s | Memory: %dMB | Thread: %s",
                i, timestamp, i, component, status, memory, Thread.currentThread().getName()
            ));
            
            // Add extra detail every 50 lines
            if (i % 50 == 0) {
                System.out.println(String.format("  └─ Progress: %.2f%% | Processed: %d | Remaining: %d", 
                    (i / 3500.0) * 100, i, 3500 - i));
            }
        }
        
        System.out.println("");
        System.out.println("=== Build Log Generation Complete - 3500+ lines generated successfully ===");
    }
}
