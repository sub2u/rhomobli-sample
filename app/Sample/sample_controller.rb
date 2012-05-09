require 'rho/rhocontroller'
require 'helpers/browser_helper'

class SampleController < Rho::RhoController
  include BrowserHelper

  # GET /Sample
  def index
    @samples = Sample.find(:all)
    render :back => '/app'
  end

  # GET /Sample/{1}
  def show
    @sample = Sample.find(@params['id'])
    if @sample
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Sample/new
  def new
    @sample = Sample.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Sample/{1}/edit
  def edit
    @sample = Sample.find(@params['id'])
    if @sample
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Sample/create
  def create
    @sample = Sample.create(@params['sample'])
    redirect :action => :index
  end

  # POST /Sample/{1}/update
  def update
    @sample = Sample.find(@params['id'])
    @sample.update_attributes(@params['sample']) if @sample
    redirect :action => :index
  end

  # POST /Sample/{1}/delete
  def delete
    @sample = Sample.find(@params['id'])
    @sample.destroy if @sample
    redirect :action => :index  
  end
end
