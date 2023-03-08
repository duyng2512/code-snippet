    @Test
    public void givenThreeFuture_returnAggregateResult() throws Exception {
        CompletableFuture<String> future1 = CompletableFuture.supplyAsync(() -> {
            await().atLeast(1, TimeUnit.MILLISECONDS);
            return "first_task";
        });
        
        CompletableFuture<String> future2 = CompletableFuture.supplyAsync(() -> {
            await().atLeast(2, TimeUnit.MILLISECONDS);
            return "second_task";
        });
        
        
        CompletableFuture<String> future3 = CompletableFuture.supplyAsync(() -> {
            await().atLeast(3, TimeUnit.MILLISECONDS);
            return "third_task";
        });
        
        CompletableFuture.allOf(future1, future2, future3)
            .thenAccept((val) -> {
                String val1 = future1.join();
                String val2 = future2.join();
                String val3 = future3.join();
                log.info("{} {} {}", val1, val2, val3);
            }).join();
    }
