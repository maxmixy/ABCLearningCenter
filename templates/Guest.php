<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Learning Resource Center</title>
    <link rel="stylesheet" href="AdminStyle.css">
</head>
<body> 
    <div class="header">
        <div>
            <h1>ABC Learning Resource Center</h1>
        </div>
        <div>
            Welcome Guest!
        </div>
    </div>

    <div>
        <div>
            <a href="/guest">Search and Reserve</a> |
            <a>Transaction Record</a> | 
        </div>
        <div>
            <a href="/log">Log in</a>
        </div>
    </div>

    <!-- Book Information Section -->
    <div id="book-info">
        <h3>Book Information</h3>
        <p><strong>ISBN:</strong> {{ book.ISBN }}</p>
        <p><strong>Title:</strong> {{ book.Title }}</p>
        <p><strong>Author:</strong> {{ book.Author }}</p>
        <p><strong>Abstract:</strong> {{ book.Abstract }}</p>
        <p><strong>Available:</strong> {{ 'Yes' if book.InStock else 'No' }}</p>
        <p><strong>Showing:</strong> {{ current_index }} / {{ total_books }}</p>
    </div>

    <!-- Filter Section -->
    <div id="filter-section">
        <h3>Filter Books</h3>
        <form method="GET" action="{{ url_for('dashboard') }}">
            <label for="category">Category:</label>
            <select id="category" name="category">
                <option value="">Select Category</option>
                {% for cat in categories %}
                    <option value="{{ cat }}" {% if request.args.get('category') == cat %}selected{% endif %}>{{ cat }}</option>
                {% endfor %}
            </select>
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" value="{{ request.args.get('title', '') }}">
            <label for="author">Author:</label>
            <input type="text" id="author" name="author" value="{{ request.args.get('author', '') }}">
            <label for="isbn">ISBN:</label>
            <input type="text" id="isbn" name="isbn" value="{{ request.args.get('isbn', '') }}">
            <button type="submit">Search</button>
        </form>
    </div>

    <!-- Navigation Controls -->
    <div id="navigation-controls">
            <button id="prev-book" {% if current_index == 1 %}class="hidden"{% endif %}>Previous</button>
            <button id="next-book" {% if current_index == total_books %}class="hidden"{% endif %}>Next</button>
    </div>

    <script>
        document.getElementById('prev-book').onclick = function() {
            window.location.href = "{{ url_for('dashboard', index=current_index - 1) }}";
        };
        document.getElementById('next-book').onclick = function() {
            window.location.href = "{{ url_for('dashboard', index=current_index + 1) }}";
        };
    </script>
    
</body>
</html> 