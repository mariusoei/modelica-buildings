within Buildings.Electrical.Transmission.Benchmark.BenchmarkGrids;
record SingleFeeder_40nodes_Al35
  "Grid with single feder and 40 nodes for benchmark (39 nodes for the loads)"
  extends Buildings.Electrical.Transmission.Grids.PartialGrid(
    Nnodes = 40,
    Nlinks = Nnodes-1,
    L = Buildings.Electrical.Transmission.Benchmark.Utilities.LineFeederLengths(Nlinks, 200, 16),
    FromTo = Buildings.Electrical.Transmission.Benchmark.Utilities.LineFeederConnections(Nlinks),
    cables = Buildings.Electrical.Transmission.Benchmark.Utilities.LineFeederCables(
             Nlinks,
             Buildings.Electrical.Transmission.LowVoltageCables.PvcAl120(),
             Buildings.Electrical.Transmission.LowVoltageCables.PvcAl35()));

  annotation (Documentation(info="<html>
</html>"));
end SingleFeeder_40nodes_Al35;