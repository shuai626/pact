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
To test parsing, do the following inside the racket IDE:

```
(require "parse.rkt")

(parse '(<insert_program_here>))
```

### Compiling:
To test compilation,do the following inside the racket IDE, run the following:

```
(require "compile.rkt")
(require "parse.rkt")

(compile (parse '(<insert_program_here>)))
```

### Testing:
To run the test suite:
```
cd pact/test
racket compile.rkt
```