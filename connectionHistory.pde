/**
 * connectionHistory class represents the history of a connection in a genome.
 */
class connectionHistory {
  // Nodes connected by this connection
  int fromNode;
  int toNode;

  // Innovation number for this connection
  int innovationNumber;

  // List of innovation numbers from the original genome before this connection was added
  ArrayList<Integer> innovationNumbers = new ArrayList<Integer>();

  //-----------------------------------------------------------------------------------------
  // Constructor for connectionHistory
  connectionHistory(int from, int to, int inno, ArrayList<Integer> innovationNos) {
    fromNode = from;
    toNode = to;
    innovationNumber = inno;
    innovationNumbers = (ArrayList<Integer>) innovationNos.clone();
  }

  //-----------------------------------------------------------------------------------------
  // Returns whether the genome matches the original genome and the connection is between the same nodes
  boolean matches(Genome genome, Node from, Node to) {
    if (genome.genes.size() == innovationNumbers.size()) {
      // If the number of connections is different, then the genomes aren't the same
      if (from.number == fromNode && to.number == toNode) {
        // Check if all the innovation numbers match from the genome
        for (int i = 0; i < genome.genes.size(); i++) {
          if (!innovationNumbers.contains(genome.genes.get(i).innovationNo)) {
            return false;
          }
        }

        // If reached this far, then the innovationNumbers match the genes' innovation numbers,
        // and the connection is between the same nodes, so it does match
        return true;
      }
    }
    return false;
  }
}
