#include <iostream>
#include <string>
#include <algorithm>
#include <cstdlib>

using namespace std;

int main(int argc, char* argv[]) {
    if (argc < 3) {
        cerr << "Error: Missing arguments!\n";
        cerr << "Usage: search <platform> <query>\n";
        cerr << "Available platforms: youtube, google, github, stackoverflow\n";
        return 1;
    } else {
        string platform = argv[1];
        transform(platform.begin(), platform.end(), platform.begin(), ::tolower);

        string query = "";
        for (int i = 2; i < argc; i++) {
            query += argv[i];
            if (i != argc - 1)
                query += "+";
        }

        string url;
        if (platform == "youtube")
            url = "https://www.youtube.com/results?search_query=" + query;
        else if (platform == "google")
            url = "https://www.google.com/search?q=" + query;
        else if (platform == "github")
            url = "https://github.com/search?q=" + query;
        else if (platform == "stackoverflow")
            url = "https://stackoverflow.com/search?q=" + query;
        else {
            cerr << "Error: Unknown platform: " << platform << endl;
            cerr << "Available platforms: youtube, google, github, stackoverflow\n";
            return 1;
        }

        cout << "Opening: " << url << endl;

        // Open the URL in the default browser
        string command = "xdg-open \"" + url + "\" &";
        system(command.c_str());
    }

    return 0;
}
