#include <bits/stdc++.h>
using namespace std;
#define N 50
string p1[N],p2[N],p3[N],school[N];

int main() {
    for (int i = 1 ; i <= 37 ; i++)
        getline(cin , school[i]);
    for (int i = 1 ; i <= 37 ; i++)
        getline(cin , p1[i]);
    for (int i = 1 ; i <= 37 ; i++)
        getline(cin , p2[i]);
    for (int i = 1 ; i <= 37 ; i++)
        getline(cin , p3[i]);
    for (int i = 1 ; i <= 37 ; i++) {
        printf("<tr>\n    <th>%d.</th>\n    <th>%s</th>\n    <th>%s</th>\n    <th>%s</th>\n     <th>%s</th>\n</tr>\n" , i , school[i].c_str() , p1[i].c_str() , p2[i].c_str() , p3[i].c_str());
    }
}
