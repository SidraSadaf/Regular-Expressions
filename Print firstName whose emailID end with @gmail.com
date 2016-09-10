#include <map>
#include <set>
#include <list>
#include <cmath>
#include <ctime>
#include <deque>
#include <queue>
#include <stack>
#include <string>
#include <bitset>
#include <cstdio>
#include <limits>
#include <vector>
#include <climits>
#include <cstring>
#include <cstdlib>
#include <fstream>
#include <numeric>
#include <sstream>
#include <iostream>
#include <algorithm>
#include <regex>
#include <unordered_map>

using namespace std;


int main(){
    int N;
    cin >> N;
    multiset<string> db;
    regex exp("[a-z].+@gmail\\.com$");        //visit https://www.hackerrank.com/challenges/30-regex-patterns/tutorial to understand each character in "" of exp
    for(int a0 = 0; a0 < N; a0++){
        string firstName;
        string emailID;
        cin >> firstName >> emailID;
        if(regex_match(emailID,exp))
            db.insert(firstName);
    }
    for(auto &it:db){
        cout<<it<<endl;
    }
    return 0;
}
