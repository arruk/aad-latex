from mpi4py import MPI
from random import random, seed
from time import perf_counter

N = 10_000_000


def calcular_pi(n):
    # Conta os pontos sorteados dentro do circulo unitario.
    dentro = sum(random() ** 2 + random() ** 2 <= 1 for _ in range(n))
    return dentro


comm = MPI.COMM_WORLD
rank = comm.Get_rank()
processos = comm.Get_size()

# O processo zero mede primeiro a implementacao serial.
if rank == 0:
    seed(0)
    inicio = perf_counter()
    dentro_serial = calcular_pi(N)
    tempo_serial = perf_counter() - inicio
    pi_serial = 4 * dentro_serial / N

# Cada processo calcula uma parcela dos pontos.
quantidade = N // processos + (rank < N % processos)
seed(rank + 1)
comm.Barrier()
inicio = MPI.Wtime()
dentro_local = calcular_pi(quantidade)
dentro_total = comm.reduce(dentro_local, op=MPI.SUM, root=0)
tempo_paralelo = MPI.Wtime() - inicio

# Apenas o processo zero recebe o total e apresenta os resultados.
if rank == 0:
    pi_paralelo = 4 * dentro_total / N
    print(f"Pi serial:   {pi_serial}")
    print(f"Tempo serial: {tempo_serial:.4f} s")
    print(f"Pi paralelo: {pi_paralelo}")
    print(f"Tempo MPI:    {tempo_paralelo:.4f} s")
    print(f"Speedup:      {tempo_serial / tempo_paralelo:.2f}")
