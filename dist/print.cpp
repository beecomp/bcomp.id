#include <bits/stdc++.h>
using namespace std;
#define N 50
string p1[N],p2[N],p3[N],school[N];

int main() {
    int n; scanf("%d" , &n);
    string nld; getline(cin , nld);
    for (int i = 1 ; i <= n ; i++)
        getline(cin , school[i]);
    for (int i = 1 ; i <= n ; i++)
        getline(cin , p1[i]);
    for (int i = 1 ; i <= n ; i++)
        getline(cin , p2[i]);
    for (int i = 1 ; i <= n ; i++)
        getline(cin , p3[i]);
    for (int i = 1 ; i <= n ; i++)
        printf("<tr>\n    <th>%d.</th>\n    <th>%s</th>\n    <th>%s</th>\n    <th>%s</th>\n    <th>%s</th>\n</tr>\n" , i , school[i].c_str() , p1[i].c_str() , p2[i].c_str() , p3[i].c_str());
}
