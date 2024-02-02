/**
 * connectionGene class represents a connection between two nodes in a neural network.
 */
class connectionGene {
  // Nodes connected by this connection
  Node fromNode;
  Node toNode;
  
  // Weight of the connection
  float weight;
  
  // Flag indicating whether the connection is enabled
  boolean enabled = true;
  
  // Innovation number for comparing genomes
  int innovationNo;

  //------------------------------------------------------------------------------------
  // Constructor for connectionGene
  connectionGene(Node from, Node to, float w, int inno) {
    fromNode = from;
    toNode = to;
    weight = w;
    innovationNo = inno;
  }

  //------------------------------------------------------------------------------------
  // Mutate the weight of the connection
  void mutateWeight() {
    float rand2 = random(1);
    if (rand2 < 0.1) {
      // 10% of the time completely change the weight
      weight = random(-1, 1);
    } else {
      // Otherwise, slightly change the weight
      weight += randomGaussian()/50;
      // Keep weight between bounds
      if (weight > 1) {
        weight = 1;
      }
      if (weight < -1) {
        weight = -1;
      }
    }
  }

  //------------------------------------------------------------------------------------
  // Returns a copy of this connectionGene
  connectionGene clone(Node from, Node to) {
    connectionGene clone = new connectionGene(from, to, weight, innovationNo);
    clone.enabled = enabled;
    return clone;
  }
}
