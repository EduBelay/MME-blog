Usage
Create diagrams in markdown using mermaid fenced code blocks:

```mermaid
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
```

aaa

```mermaid
mindmap
  root((ARQUITECTURA DE COMPUTADORES))
    ELEMENTOS FUNCIONAIS
     Periféricos de entrada
     CPU
      Unidad de control
      Unidade Aritmético Lóxica
     Memoria
     Periféricos de saída
    PROCESADORES MÓBILES
      
    NOVAS ARQUITECTURAS

    CHIPS NEUROMÓRFICOS
```
```mermaid
gitGraph
       commit
       commit
       branch develop
       checkout develop
       commit
       commit
       checkout main
       merge develop
       commit
       commit
```

```mermaid
pie
    title Pie Chart
    "Dogs" : 386
    "Cats" : 85
    "Rats" : 150 
```

```mermaid
stateDiagram
    [*] --> Still
    Still --> [*]

    Still --> Moving
    Moving --> Still
    Moving --> Crash
    Crash --> [*]
```

```mermaid
graph LR
A[Hard edge] -->B(Round edge)
    B --> C{Decision}
    C -->|One| D[Result one]
    C -->|Two| E[Result two]
```

```mermaid
graph LR
A[Rexistro no sistema] -->B(Round edge)
    B --> C{Decision}
    C -->|One| D[Result one]
    C -->|Two| E[Result two]
```