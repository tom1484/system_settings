/**
ID: angelus6
TASK: cowtour
LANG: C++
**/
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

#define cin fin
#define cout fout
ifstream fin("cowtour.in");
ofstream fout("cowtour.out");

const int maxn = 150;

int N;
char c;
pii pos[maxn];
bool edge[maxn][maxn];
bool reach[maxn][maxn];
double path[maxn][maxn];
double diam[maxn];

void dfs(int s, int i) {
	reach[s][i] = true;
	FOR (j, 0, N)
		if (edge[i][j] && !reach[s][j])
			dfs(s, j);
	return ;
}

int main () {

	cin >> N;
	FOR (i, 0, N)
		cin >> pos[i].ft >> pos[i].sd;
	
	FOR (i, 0, N) {
		FOR (j, 0, N) {
			cin >> c;
			edge[i][j] = c-'0';
			if (edge[i][j] && i != j)
				path[i][j] = path[j][i] = 
					sqrt(pow(pos[i].ft-pos[j].ft, 2)+pow(pos[i].sd-pos[j].sd, 2));
			else if (i == j)
				path[i][j] = 0;
			else
				path[i][j] = path[j][i] = 1e9;
		}
	}

	FOR (k, 0, N)
		FOR (i, 0, N)
			FOR (j, 0, N)
				path[i][j] = min(path[i][j], path[i][k]+path[k][j]);

	double gdiam = 0;
	FOR (i, 0, N) {
		memset(reach[i], 0, sizeof reach[i]);
		dfs(i, i);
		FOR (j, 0, N)
			if (reach[i][j])
				diam[i] = max(diam[i], path[i][j]);
		gdiam = max(gdiam, diam[i]);
	}

	double ans = 1e9;
	FOR (i, 0, N)
		FOR (j, 0, N)
			if (!reach[i][j])
				ans = min(ans, diam[i]+diam[j]+
						sqrt(pow(pos[i].ft-pos[j].ft, 2)+pow(pos[i].sd-pos[j].sd, 2)));
	cout << fixed << setprecision(6) << max(gdiam, ans) << '\n';

	return 0;
}
