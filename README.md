# Modulo

Modulo is a Radiant extension that adds tags for conditional rendering of child pages based on their ordinal values. For example, it can render different markup for odd or even children:

    <r:children:each>
      <r:modulo>
      <r:if_odd>
        <div class="left">
      </r:if_odd>
      <r:if_even>
        <div class="right">
      </r:if_even>
          <r:content part="body" />
        </div>
    </r:modulo>
    </r:children:each>

## New tags in Modulo

Modulo introduces the following new Radius tags:

* `<r:modulo:f_even>`
* `<r:modulo:unless_even>`
* `<r:modulo:if_odd>`
* `<r:modulo:unless_odd>`
    
* `<r:modulo columns="3">`
*   `<r:if_last_column>`
*   `<r:index`
* `</r:modulo>`
