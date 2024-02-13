Feature: Jekyll badges tag with some sample badges

  Background:
    Given I have a configuration with:
      """
      badges:
        disable_in_development: false
        template: _includes/badges.html
      """
    And I have a _data file "badges.yaml" with:
      """
      - id: "some-badge-id"
        title: "This is some badge"
        description: "This is just a placeholder badge for now."
        image_url: "assets/resized/avi-480x480.jpg"
        created: "2024-02-10"
        granted: "2024-02-10"
        show: true

      - id: "other-badge-id"
        title: "This is some other badge"
        description: "This is just a placeholder badge for now."
        image_url: "assets/resized/avi-480x480.jpg"
        created: "2024-02-10"
        granted: "2024-02-11"
        show: true

      - id: "ungranted-badge-id"
        title: "This is some other badge that hasn't been granted yet"
        description: "This is just a placeholder badge for now."
        image_url: "assets/resized/avi-480x480.jpg"
        created: "2024-02-10"
        show: true

      - id: "hidden-badge-id"
        title: "This is a hidden badge"
        granted: "2024-02-10"
      """
    And I have a file "index.html" with "{% render_badges %}"

  Scenario: Simple badges tag with some badges defined
    When I run Jekyll
    Then I should see "<div class=\"badges\">" in "_site/index.html"
    * I should see "ungranted-badge-id" in "_site/index.html"
    * I should see "other-badge-id" in "_site/index.html"
    * I should see "some-badge-id" in "_site/index.html"
    But I shouldn't see "hidden-badge-id" in "_site/index.html"
