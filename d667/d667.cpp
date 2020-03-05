#include <bits/stdc++.h>
using namespace std;

#define ll long long
#define uint unsigned int
#define ull unsigned ll
#define pii pair<int, int>

#define FOR(i, a, b) for (uint i = a; i < b; i++)
#define RFOR(i, a, b) for (uint i = a; i > b; i--)

#define pb push_back
#define ft first
#define sd second

struct Arc {
	int from, to, cap, flow, res;
	
	Arc() {}

	Arc(int from, int to, int cap): from(from), to(to), cap(cap) {
		flow = 0;
		res = cap-flow;
	}

	void add(int val) {
		flow += val;
		res -= val;
	}
};

struct Flow {
	int V, src, tar;
	vector<vector<Arc>> arcs;

	Flow() {}

	Flow(int v, int src, int tar): V(v), src(src), tar(tar) {
		arcs.resize(V);
	}

	void addArc(int from, int to, int cap) {
		arcs[from].pb(Arc(from, to, cap));
	}

	void bfs(int s, int minRes, int* prev, bool* vis) {
		for (Arc arc: arcs[s]) {
			int to = arc.to, res = arc.res;
			if (vis[to] || res <= 0)
				continue;
			prev[to] = s;
			vis[to] = true;
			bfs(to, min(minRes, res), prev, vis);
		}
	}

	int maxFlow() {
		int flow = 0;
		Arc* prev[V];
		int minRes[V];
		bool vis[V];
		queue<int> q;

		while (true) {
			memset(vis, 0, sizeof vis);
			memset(minRes, 0, sizeof minRes);

			q.push(src);
			vis[src] = true;
			minRes[src] = 1e9;
			while (!q.empty()) {
				int s = q.front();
				q.pop();

				for (Arc arc: arcs[s]) {
					int to = arc.to, res = arc.res;
					if (vis[to] || res <= 0)
						continue;
					vis[to] = true;
					prev[to] = &arc;
					minRes[to] = min(res, minRes[s]);
					q.push(to);
				}
			}

			/* if (!minRes[tar]) */
				/* break; */
			


			break;
		}

		for (int x: minRes)
			cout << x << ' ';

		return flow;
	}
} f;

int main() {
	ios::sync_with_stdio(false);
	cin.tie(NULL);

	int N, s, t, E;
	cin >> N >> s >> t >> E;
	f = Flow(N, s-1, t-1);

	int u, v, c;
	FOR (i, 0, E) {
		cin >> u >> v >> c;
		u--, v--;
		f.addArc(u, v, c);
		f.addArc(v, u, c);
	}

	cout << f.maxFlow() << '\n';

	return 0;
}
