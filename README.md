# outlaw/

Hosts files for the original 430 Outlaw compiler

# pact/

Hosts files for compiler with function contracts

## Instructions:
To open the Racket IDE:
```
cd pact
racket
```

### Parsing:
To test parsing, first modify `example.rkt` with desired code. Then, inside the racket IDE:

```
(require "parse-file.rkt")

(main "example.rkt")
```

### Compiling:
To test compilation, first modify `example.rkt` with desired code. Then, inside the racket IDE, run the following:

```
(require "compile-file.rkt")

(main "example.rkt")
```

### Testing:
To run the test suite:
```
cd pact/test
racket compile.rkt
```