//
//  main.m
//  Selectores
//
//  Created by Marcelo Arcidiácono on 9/1/19.
//  Copyright © 2019 Marcelo Arcidiácono. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ejemplo : NSObject

- (void)ejemplo1;
- (void)ejemplo2;
- (void)ejemplo3;

- (void) nuevoMethod;

// creado develop branch

@end

@implementation Ejemplo


// Crearemos una Dispatch Queue serial

-(void)ejemplo1 {
    dispatch_queue_t cola = dispatch_queue_create("com.meli.itAcademy.ejemplo1", nil);
    
    dispatch_async(cola, ^{
        for(int i = 0; i < 10; i++) {
            NSLog(@"i es %d", i);
        }
    });
    
    NSLog(@"Algo fuera del primer bloque.");
    
    dispatch_async(cola, ^{
        for(int j = 0; j < 10; j++) {
            NSLog(@"j es %d", j);
        }
    });
    
    NSLog(@"Algo fuera del segundo bloque.");
    
}

- (void)ejemplo2 {
    dispatch_queue_t cola = dispatch_queue_create("com.meli.itAcademy.ejemplo2", nil);
    
    dispatch_sync(cola, ^{
        for(int i = 0; i < 10; i++) {
            NSLog(@"i es %d", i);
        }
    });
    
    NSLog(@"Algo fuera del primer bloque.");
    
    dispatch_sync(cola, ^{
        for(int j = 0; j < 10; j++) {
            NSLog(@"j es %d", j);
        }
    });
    
    NSLog(@"Algo fuera del segundo bloque.");
}

- (void)ejemplo3 {
    
    dispatch_queue_t global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_sync(global, ^{
        NSLog(@"Esta es la primera tarea agregada a la cola global.");
    });
    
    dispatch_sync(global, ^{
        for(int j = 0; j < 10; j++) {
            NSLog(@"j es %d", j);
        }
    });
    
    dispatch_async(global, ^{
        for(int i = 0; i < 10; i++) {
            NSLog(@"i es %d", i);
        }
    });
    
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
    }
    return 0;
}
