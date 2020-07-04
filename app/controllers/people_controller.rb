class PeopleController < ApplicationController

  layout 'people'

  def index
    @msg = 'Person data.'
    @data = Person.all
  end

  def show
  @msg = "Indexed data."
  @data = Person.find(params[:id])
  end

  def add
    @msg = "add new data."
    @person = Person.new
  end


  def create
    if request.post? then
      Person.create(person_params)
    end
    redirect_to '/people'
  end

  def edit
    @msg = "edit data.[id = " + params[:id] + "]"
    @person = Person.find(params[:id])
  end


  def update
    obj = Person.find(params[:id])
    obj.update(person_params)
    redirect_to '/people'
  end

  def delete
    obj = Person.find(params[:id])
    obj.destroy
    redirect_to '/people'
  end

  def find
    @msg = 'please type search word...'
    @people = Array.new
    if request.post? then
      #obj = Person.find params['find'] # with id
      #@people.push obj # with id
      #@people = Person.where name: params[:find] # where search
      #@people = Person.where "age >= ?", params[:find] # with expression
      #@people = Person.where "mail like ?", # with like search
      #'%' + params[:find] + '%' #with like search
      #f = params[:find].split ',' # multiple search
      #@people = Person.where "age >= ? and age <= ?", f[0], f[1] # multiple search
      #f = '%' + params[:find] + '%' # or expression
      #@people = Person.where "name like ? or mail like ?", f, f #or expression
      #f = '%' + params[:find] + '%' #first last data
      #result = Person.where "name like ? or mail like ?", f, f #first last data
      #@people.push result.first #first last data
      #@people.push result.last #first last data
      f = params[:find].split(',')
      @people = Person.find(f)
    end
  end

  private
  def person_params
    params.require(:person).permit(:name, :age, :mail)
  end

end
