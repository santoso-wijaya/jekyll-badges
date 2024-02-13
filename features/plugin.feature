Feature: General Jekyll plugin usage

  Scenario: No config at all
    Given I have no configuration
    When I run Jekyll
    Then there should be no errors
  
  Scenario: Config with empty badges block
    Given I have a badges configuration with:
      """
      """
    When I run Jekyll
    Then there should be no errors

  Scenario: Simple badges tag with no badges defined
    Given I have a badges configuration with "template" set to "_includes/badges.html"
    And I have a file "index.html" with "{% render_badges %}"
    When I run Jekyll
    Then I should see "<div class=\"no-badges\">" in "_site/index.html"

  Scenario: Simple badges tag with no template nor badges defined
    Given I have a configuration with:
      """
      badges:
        disable_in_development: false
      """
    And I have a file "index.html" with "{% render_badges %}"
    When I run Jekyll
    Then I should see "<div class=\"no-badges\">" in "_site/index.html"

  Scenario: Simple badges tag with no configuration nor badges defined
    Given I have no configuration
    And I have a file "index.html" with "{% render_badges %}"
    When I run Jekyll
    Then I should see "<div class=\"no-badges\">" in "_site/index.html"