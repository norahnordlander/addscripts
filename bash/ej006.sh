#!/bin/bash

# Pide dos números por teclado para realizar operaciones
echo "Introduce el primer número:"
read num1
echo "Introduce el segundo número:"
read num2

# Calcula y muestra las distintas operaciones usando expansión aritmética
echo "Suma: $((num1 + num2))"
echo "Resta: $((num1 - num2))"
echo "Multiplicación: $((num1 * num2))"
echo "División: $((num1 / num2))"
