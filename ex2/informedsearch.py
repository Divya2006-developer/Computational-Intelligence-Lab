import heapq

class Node:
    def __init__(self, st):
        self.st = st
        self.adj = []

class Graph:
    def __init__(self):
        self.nodes = {}

    def add_node(self, st):
        if st not in self.nodes:
            self.nodes[st] = Node(st)
            print(f"Node '{st}' added")
        else:
            print(f"Node '{st}' already exists")

    def remove_node(self, st):
        if st in self.nodes:
            for n in self.nodes.values():
                n.adj = [edge for edge in n.adj if edge[0] != st]
            del self.nodes[st]
            print(f"Node {st} deleted")
        else:
            print(f"Node {st} not found")

    def add_edge(self, fr, to, weight=1):
        if fr in self.nodes and to in self.nodes:
            if not any(edge[0] == to for edge in self.nodes[fr].adj):
                self.nodes[fr].adj.append((to, weight))
                self.nodes[to].adj.append((fr, weight))
                print(f"Edge added: {fr} <-> {to} (Weight: {weight})")
            else:
                print(f"Edge {fr}-{to} already exists")
        else:
            print("One or both nodes not found")

    def del_edge(self, fr, to):
        if fr in self.nodes and to in self.nodes:
            self.nodes[fr].adj = [e for e in self.nodes[fr].adj if e[0] != to]
            self.nodes[to].adj = [e for e in self.nodes[to].adj if e[0] != fr]
            print(f"Edge deleted: {fr} <-> {to}")
        else:
            print("Nodes not found")

    def display(self):
        print("\nAdjacency list (Node -> Neighbor, Weight):")
        for st in self.nodes:
            adj_str = ", ".join([f"({n},{w})" for n, w in self.nodes[st].adj]) if self.nodes[st].adj else "None"
            print(f"{st} -> {adj_str}")

    def astar(self, start, goal, heuristic):

        fringe = [(heuristic[start], 0, start, [start])]
        visited = {}

        print(f"\n--- A* Search  ---")

        while fringe:

            fringe.sort()

            print("\nCurrent Fringe :")
            for f, g, node, path in fringe:
                print(f"  Node {node} | path =  {path} | f(n) = {f} ")

            f, g, current, path = heapq.heappop(fringe)

            print(f"--> Selected node '{current}'")

            if current == goal:
                print(f"\nGoal '{goal}' reached!")
                return path, g

            if current in visited and g >= visited[current]:
                continue
            visited[current] = g

            for neighbor, weight in self.nodes[current].adj:
                new_g = g + weight
                new_f = new_g + heuristic[neighbor]
                if neighbor not in visited or new_g < visited[neighbor]:
                    new_path = path + [neighbor]
                    heapq.heappush(fringe, (new_f, new_g, neighbor, new_path))
                    print(f"    Discovered: {current} -> {neighbor} | f(n) = {new_f}")

        return None, None

def main():
    g = Graph()
    while True:
        print("\n1.Add nodes 2.Remove node 3.Add edge 4.Remove edge 5.Display 6.A* search 7.Exit")
        choice = input("Enter choice: ")
        if choice == '1':
            n = int(input("How many nodes? "))
            for _ in range(n): g.add_node(input("Node name: "))
        elif choice == '2':
            g.remove_node(input("Node name: "))
        elif choice == '3':
            fr, to = input("From: "), input("To: ")
            w = int(input("Weight: "))
            g.add_edge(fr, to, w)
        elif choice == '4':
            fr = input("Source: ")
            to = input("Dest: ")
            g.del_edge(fr, to)
        elif choice == '5':
            g.display()
        elif choice == '6':
            print("\nEnter heuristic values :")
            heuristic = {}
            for node_name in g.nodes:
                val = int(input(f"h({node_name})="))
                heuristic[node_name] = val

            start = input("Start :")
            goal = input("Goal :")

            if start in g.nodes and goal in g.nodes:
                path, total_cost = g.astar(start, goal, heuristic)
                if path:
                    print(f"\nFinal Optimal Path: {' -> '.join(path)}")
                    print(f"Total Cost: {total_cost}")
                else:
                    print("No path found.")
            else:
                print("Start or Goal node not found.")
        elif choice == '7':
            break
        else:
            print("Invalid choice..Try another number")

if __name__ == "__main__":
    main()
