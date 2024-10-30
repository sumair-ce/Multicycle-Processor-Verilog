<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<h1 align="center">Multicycle Processor Design and Implementation</h1>

<p>This Verilog project implements a multicycle processor, where each instruction executes over multiple clock cycles, optimizing resource usage and enhancing control over each execution stage.</p>

<h2>Features</h2>
<ul>
    <li>Multicycle datapath for efficient use of hardware resources</li>
    <li>Detailed control of fetch, decode, execute, memory access, and write-back stages</li>
    <li>Enhanced performance with reduced clock frequency requirements per instruction</li>
</ul>

<h2>Implemented Instructions</h2>
<ul>
    <li><code>beq</code> - Branch if Equal</li>
    <li><code>R-type</code> - Arithmetic and logical operations</li>
    <li><code>lw</code> - Load Word</li>
    <li><code>sw</code> - Store Word</li>
    <li><code>j</code> - Jump</li>
</ul>

<h2>Usage</h2>
<p>The multicycle processor design divides instruction execution into multiple cycles, making it ideal for applications requiring efficient resource allocation across each stage of execution.</p>

<h2>Acknowledgments</h2>
<ul>
    <li>RISC architecture and multicycle processor design references</li>
    <li>Open source Verilog resources and simulation tools</li>
</ul>

</body>
</html>
