module RequestSpecHelper
  # Parse JSON response to ruby hash
  def json
    JSON.parse(response.body)
  end

  def tech_tag 
    {
      'author' => 'Rylee Paul',
      'authorId' => 9,
      'id' => 1,
      'likes' => 960,
      'popularity' => 0.13,
      'reads' => 50_361,
      'tags' => [
        'tech',
        'health'
      ]
    }
  end
end

def likes_sortby
  {
    'author' => 'Bryson Bowers',
    'authorId' => 6,
    'id' => 85,
    'likes' => 25,
    'popularity' => 0.18,
    'reads' => 16_861,
    'tags' => [
      'tech'
    ]
  }
end

def descending_direction
  {
    'author' => 'Jon Abbott',
    'authorId' => 4,
    'id' => 95,
    'likes' => 985,
    'popularity' => 0.42,
    'reads' => 55_875,
    'tags' => [
      'politics',
      'tech',
      'health',
      'history'
    ]
  }
end

def ascending_direction
  {
    'author' => 'Bryson Bowers',
    'authorId' => 6,
    'id' => 85,
    'likes' => 25,
    'popularity' => 0.18,
    'reads' => 16_861,
    'tags' => [
      'tech'
    ]
  }
end
